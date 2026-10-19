import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as int? ?? 1,
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}

class PostService {
  static const String _authority = 'jsonplaceholder.typicode.com';
  static const Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<List<Post>> getPosts() async {
    final uri = Uri.https(_authority, 'posts');
    final response = await http.get(uri, headers: _headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
      return data
          .map((item) => Post.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Erro ao carregar posts: Código ${response.statusCode}');
    }
  }

  Future<Post> getPost(int id) async {
    final uri = Uri.https(_authority, 'posts/$id');
    final response = await http.get(uri, headers: _headers);

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Erro ao encontrar post #$id: Código ${response.statusCode}');
    }
  }

  Future<Post> createPost(Post post) async {
    final uri = Uri.https(_authority, 'posts');
    final response = await http.post(
      uri,
      headers: _headers,
      body: jsonEncode(post.toJson()),
    );

    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Erro ao criar post: Código ${response.statusCode}');
    }
  }

  Future<Post> updatePost(Post post) async {
    final uri = Uri.https(_authority, 'posts/${post.id}');
    final response = await http.put(
      uri,
      headers: _headers,
      body: jsonEncode(post.toJson()),
    );

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Erro ao atualizar post: Código ${response.statusCode}');
    }
  }

  Future<void> deletePost(int id) async {
    final uri = Uri.https(_authority, 'posts/$id');
    final response = await http.delete(uri, headers: _headers);

    if (response.statusCode != 200) {
      throw Exception('Erro ao eliminar post #$id: Código ${response.statusCode}');
    }
  }
}

void main() {
  runApp(const CrudApp());
}

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade 3 - HTTP CRUD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const PostsScreen(),
    );
  }
}

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final PostService _service = PostService();
  List<Post> _posts = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final posts = await _service.getPosts();
      if (!mounted) return;
      setState(() => _posts = posts);
    } catch (e) {
      if (!mounted) return;
      setState(() => _errorMessage = e.toString());
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showNotification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _showPostDialog({Post? post}) async {
    final titleController = TextEditingController(text: post?.title);
    final bodyController = TextEditingController(text: post?.body);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(post == null ? 'Criar Post (POST)' : 'Editar Post #${post.id} (PUT)'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: bodyController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Conteúdo',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Guardar'),
          ),
        ],
      ),
    );

    if (confirmed == true && titleController.text.isNotEmpty) {
      if (post == null) {
        try {
          final newPost = await _service.createPost(
            Post(userId: 1, id: 0, title: titleController.text, body: bodyController.text),
          );
          if (!mounted) return;
          setState(() => _posts.insert(0, newPost));
          _showNotification('Post criado com sucesso (ID provisório: ${newPost.id})');
        } catch (e) {
          _showNotification('Erro: $e');
        }
      } else {
        try {
          final updatedPost = await _service.updatePost(
            Post(userId: post.userId, id: post.id, title: titleController.text, body: bodyController.text),
          );
          if (!mounted) return;
          setState(() {
            final index = _posts.indexWhere((p) => p.id == post.id);
            if (index != -1) _posts[index] = updatedPost;
          });
          _showNotification('Post #${post.id} atualizado');
        } catch (e) {
          _showNotification('Erro: $e');
        }
      }
    }
  }

  Future<void> _deletePost(Post post) async {
    try {
      await _service.deletePost(post.id);
      if (!mounted) return;
      setState(() => _posts.removeWhere((p) => p.id == post.id));
      _showNotification('Post #${post.id} removido');
    } catch (e) {
      _showNotification('Erro: $e');
    }
  }

  Future<void> _searchPostById() async {
    final searchController = TextEditingController();
    final idString = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Pesquisar por ID (GET)'),
        content: TextField(
          controller: searchController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'ID do post (ex: 1 a 100)',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, searchController.text),
            child: const Text('Procurar'),
          ),
        ],
      ),
    );

    final id = int.tryParse(idString ?? '');
    if (id == null) return;

    try {
      final post = await _service.getPost(id);
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('#${post.id} - ${post.title}'),
          content: Text(post.body),
          actions: [
            FilledButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Fechar'),
            ),
          ],
        ),
      );
    } catch (e) {
      _showNotification('Erro ao pesquisar: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    } else if (_errorMessage != null) {
      content = Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.cloud_off, size: 48, color: Colors.red),
              const SizedBox(height: 12),
              Text(_errorMessage!, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton.tonal(
                onPressed: _fetchPosts,
                child: const Text('Tentar novamente'),
              ),
            ],
          ),
        ),
      );
    } else if (_posts.isEmpty) {
      content = const Center(child: Text('Nenhum post disponível'));
    } else {
      content = RefreshIndicator(
        onRefresh: _fetchPosts,
        child: ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: _posts.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final post = _posts[index];
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  child: Text('${post.id}'),
                ),
                title: Text(
                  post.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  post.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      tooltip: 'Editar (PUT)',
                      onPressed: () => _showPostDialog(post: post),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      tooltip: 'Remover (DELETE)',
                      onPressed: () => _deletePost(post),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividade 3 - HTTP CRUD'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Buscar por ID (GET)',
            onPressed: _searchPostById,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Recarregar lista (GET)',
            onPressed: _fetchPosts,
          ),
        ],
      ),
      body: content,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPostDialog(),
        tooltip: 'Criar Post (POST)',
        child: const Icon(Icons.add),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Open the navigation drawer
            Scaffold.of(context).openDrawer();
          },
        ),
        title: Text(
          'My Notes',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Navigate to the Search Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.note, color: Colors.black),
              title: Text('All Notes'),
              onTap: () {
                // Navigate to All Notes Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllNotesScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text('Trash'),
              onTap: () {
                // Navigate to Trash Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrashScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.folder, color: Colors.blue),
              title: Text('Manage Folders'),
              onTap: () {
                // Navigate to Manage Folders Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ManageFoldersScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                NoteCard(
                  title: 'To Do',
                  date: 'August 8',
                  content: '1. Finish project\n2. Review PRs\n3. Prepare demo',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('To Do clicked')),
                    );
                  },
                ),
                NoteCard(
                  title: 'Meeting Notes',
                  date: 'July 20',
                  content: 'Discuss roadmap and goals for Q4.',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Meeting Notes clicked')),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle Add button click
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Add Note clicked')),
          );
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final String title;
  final String date;
  final String content;
  final VoidCallback onTap;

  const NoteCard({
    Key? key,
    required this.title,
    required this.date,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Screens for navigation

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: Text('Search Screen'),
      ),
    );
  }
}

class AllNotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Notes'),
      ),
      body: Center(
        child: Text('All Notes Screen'),
      ),
    );
  }
}

class TrashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trash'),
      ),
      body: Center(
        child: Text('Trash Screen'),
      ),
    );
  }
}

class ManageFoldersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Folders'),
      ),
      body: Center(
        child: Text('Manage Folders Screen'),
      ),
    );
  }
}

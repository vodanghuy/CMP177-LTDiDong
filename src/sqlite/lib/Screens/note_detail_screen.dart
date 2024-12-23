import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/note.dart';
import '../Database/database_helper.dart';

class NoteDetailScreen extends StatefulWidget{
  const NoteDetailScreen({Key? key}) : super(key:key);
  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}
class _NoteDetailScreenState extends State<NoteDetailScreen>{
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  void dispose()
  {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _saveNote() async{
    if(_titleController.text.isEmpty || _contentController.text.isEmpty)
      {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all fields')),
        );
        return;
      }
    final note = Note(
      title: _titleController.text,
      content: _contentController.text
    );
    await _dbHelper.insertNote(note);
    if(mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              height: 200,
              child: TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  labelText: 'Content',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: null,
                expands: true,
              ),
            ),
            const SizedBox(height: 16,),
            Row(
              children: [
                // Cancel Button
                Expanded(
                  child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(height: 16,),
                // Save Button
                Expanded(
                  child: ElevatedButton(
                      onPressed: _saveNote,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    child: const Text('Save'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
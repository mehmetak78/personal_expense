import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx) {
    print('Constructor NewTransactionWidget');
  }

  @override
  _NewTransactionState createState() {
    print('createState NewTransactionWidget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  _NewTransactionState() {
    print('Constructor NewTransactionState');
  }

  @override
  void initState() {
    super.initState();
    print('initState() NewTransactionState');
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget NewTransactionState');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose() NewTransactionState');
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addNewTx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitData,
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date Chosen'
                          : 'Date: ${DateFormat.yMMMd().format(_selectedDate!)}'),
                    ),
                    TextButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: _submitData,
                style: TextButton.styleFrom(
                  //elevation: 5,
                  //shadowColor: Colors.red,
                  side: BorderSide(color: Colors.red, width: 1),
                  primary: Theme.of(context).textTheme.button?.color,
                  textStyle: TextStyle(
                    fontSize: 14,
                    //fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

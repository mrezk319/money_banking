import 'package:banking_app/Data/Models/Transfers.dart';
import 'package:banking_app/Data/Repo/TransferStorageRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'transfer_state.dart';

class TransferCubit extends Cubit<TransferState> {
  final TransferDatabaseRepo transferDatabaseRepo;
  List<Transfer>Transfers=[];

  TransferCubit(this.transferDatabaseRepo) : super(TransferInitial());
  Future<List<Transfer>> retrieveItems() async {
    Transfers=await transferDatabaseRepo.retrieveItems();
    emit(TransferLoaded(Transfers));
    return Transfers;
  }
  Future<void> insertItems(Transfer transfer) async {
    await transferDatabaseRepo.insertItem(transfer);
    emit(TransferInserted());
    await retrieveItems();
  }
}

part of 'transfer_cubit.dart';

@immutable
abstract class TransferState {}

class TransferInitial extends TransferState {}
class TransferLoaded extends TransferState {
   List<Transfer> transfer;
  TransferLoaded(this.transfer);
}
class TransferInserted extends TransferState {}
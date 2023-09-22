import ballerina/grpc;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: LIBRARY_DESC}
service "LibraryService" on ep {

    remote function GetAvailableBooks(EmptyRequest value) returns BookListResponse|error {
        
    }
    remote function BorrowBook(BorrowBookRequest value) returns BookResponse|error {
    }

    remote function SearchBook(SearchBookRequest value) returns BookListResponse|error {
    }
    remote function LocateBook(LocateBookRequest value) returns BookLocationResponse|error {
    }
    remote function ReturnBook(ReturnBookRequest value) returns BookResponse|error {
    }
    remote function AddBook(AddBookRequest value) returns BookResponse|error {
    }
    remote function UpdateBook(UpdateBookRequest value) returns BookResponse|error {
    }
    remote function RemoveBook(RemoveBookRequest value) returns BookListResponse|error {
    }
    remote function ListBorrowedBooks(EmptyRequest value) returns BookListResponse|error {
    }
}

p
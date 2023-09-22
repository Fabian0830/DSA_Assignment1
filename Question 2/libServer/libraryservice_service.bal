import ballerina/grpc;
import ballerina/log;

// Import your generated Protocol Buffer file
import library

public function main() returns error? {
    // Create a gRPC client to connect to the server.
    LibraryServiceClient ep = check new ("http://localhost:9090");

    EmptyRequest getAvailableBooksRequest = {};
    BookListResponse getAvailableBooksResponse = check ep->GetAvailableBooks(getAvailableBooksRequest);
    io:println("Available Books:");
    foreach var book in getAvailableBooksResponse.books {
        io:println("Title: " + book.title + ", Author: " + book.author + ", ISBN: " + book.ISBN);
    }

    BorrowBookRequest borrowBookRequest = {ISBN: "ballerina", userID: "ballerina"};
    BookResponse borrowBookResponse = check ep->BorrowBook(borrowBookRequest);
    io:println("Borrow Book Response: " + borrowBookResponse.ISBN);

    SearchBookRequest searchBookRequest = {title: "ballerina"};
    BookListResponse searchBookResponse = check ep->SearchBook(searchBookRequest);
    io:println("Search Book Response:");
    foreach var book in searchBookResponse.books {
        io:println("Title: " + book.title + ", Author: " + book.author + ", ISBN: " + book.ISBN);
    }

    LocateBookRequest locateBookRequest = {ISBN: "ballerina"};
    BookLocationResponse locateBookResponse = check ep->LocateBook(locateBookRequest);
    io:println("Locate Book Response: " + locateBookResponse.location);

    ReturnBookRequest returnBookRequest = {ISBN: "ballerina"};
    BookResponse returnBookResponse = check ep->ReturnBook(returnBookRequest);
    io:println("Return Book Response: " + returnBookResponse.ISBN);

    AddBookRequest addBookRequest = {title: "ballerina", author: "ballerina", ISBN: "ballerina"};
    BookResponse addBookResponse = check ep->AddBook(addBookRequest);
    io:println("Add Book Response: " + addBookResponse.ISBN);

    UpdateBookRequest updateBookRequest = {ISBN: "ballerina", title: "ballerina", author: "ballerina"};
    BookResponse updateBookResponse = check ep->UpdateBook(updateBookRequest);
    io:println("Update Book Response: " + updateBookResponse.ISBN);

    RemoveBookRequest removeBookRequest = {ISBN: "ballerina"};
    BookListResponse removeBookResponse = check ep->RemoveBook(removeBookRequest);
    io:println("Remove Book Response:");
    foreach var book in removeBookResponse.books {
        io:println("Title: " + book.title + ", Author: " + book.author + ", ISBN: " + book.ISBN);
    }

    EmptyRequest listBorrowedBooksRequest = {};
    BookListResponse listBorrowedBooksResponse = check ep->ListBorrowedBooks(listBorrowedBooksRequest);
    io:println("List Borrowed Books:");
    foreach var book in listBorrowedBooksResponse.books {
        io:println("Title: " + book.title + ", Author: " + book.author + ", ISBN: " + book.ISBN);
    }
}


import ballerina/grpc;
import ballerina/io;

// Import your generated proto file
import library;

public function main() {
    // Create a gRPC client
    library.LibraryServiceClient libraryClient = new library.LibraryServiceClient("http://localhost:9090");

    // Make RPC calls to the server

    // Make GetAvailableBooks RPC call
    library.EmptyRequest emptyRequest = new library.EmptyRequest();
    library.BookListResponse bookListResponse = check libraryClient->getAvailableBooks(emptyRequest);
    // Process and display the available books
    foreach var book in bookListResponse.books {
        io:println("Title: " + book.title + ", Author: " + book.author + ", ISBN: " + book.ISBN);
    }

    // Make BorrowBook RPC call
    library.BorrowBookRequest borrowRequest = new library.BorrowBookRequest();
    borrowRequest.ISBN = "ISBN123";
    borrowRequest.userID = "UserID123";
    library.BookResponse borrowResponse = check libraryClient->borrowBook(borrowRequest);
    // Process and display the response, which may contain ISBN or other details

    // Implement other RPC calls similarly

    // Close the gRPC client connection
    libraryClient->close();
}

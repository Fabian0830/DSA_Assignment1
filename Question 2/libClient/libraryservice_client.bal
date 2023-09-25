import ballerina/io;

LibraryServiceClient ep = check new("http://localhost:9090");

public function main() returns error? {

    // 1. Get Available Books
    EmptyRequest getAvailableBooksRequest = {};
    var getAvailableBooksResponse = check ep->GetAvailableBooks(getAvailableBooksRequest);
    io:println("Available Books:");
    foreach var book in getAvailableBooksResponse.books {
        io:println("Title: " + book.title + ", Author: " + book.author + ", ISBN: " + book.ISBN);
    }

    // 2. Borrow Book
    BorrowBookRequest borrowBookRequest = {ISBN: "12345", userID: "user1"};
    var borrowBookResponse = check ep->BorrowBook(borrowBookRequest);
    io:println("Borrowed Book with ISBN: " + borrowBookResponse.ISBN);

    // 3. Search Book
    SearchBookRequest searchBookRequest = {title: "Book1"};
    var searchBookResponse = check ep->SearchBook(searchBookRequest);
    io:println("Search Results for 'Book1':");
    foreach var book in searchBookResponse.books {
        io:println("Title: " + book.title + ", Author: " + book.author + ", ISBN: " + book.ISBN);
    }

    // 4. Locate Book
    LocateBookRequest locateBookRequest = {ISBN: "12345"};
    var locateBookResponse = check ep->LocateBook(locateBookRequest);
    io:println("Location of Book with ISBN 12345: " + locateBookResponse.location);

    // 5. Return Book
    ReturnBookRequest returnBookRequest = {ISBN: "12345"};
    var returnBookResponse = check ep->ReturnBook(returnBookRequest);
    io:println("Returned Book with ISBN: " + returnBookResponse.ISBN);

    // 6. Add Book
    AddBookRequest addBookRequest = {title: "New Book", author: "Author3", ISBN: "67890"};
    var addBookResponse = check ep->AddBook(addBookRequest);
    io:println("Added Book with ISBN: " + addBookResponse.ISBN);

    // 7. Update Book
    UpdateBookRequest updateBookRequest = {ISBN: "67890", title: "Updated Book", author: "Author4"};
    var updateBookResponse = check ep->UpdateBook(updateBookRequest);
    io:println("Updated Book with ISBN: " + updateBookResponse.ISBN);

    // 8. Remove Book
    RemoveBookRequest removeBookRequest = {ISBN: "67890"};
    var removeBookResponse = check ep->RemoveBook(removeBookRequest);
    io:println("Removed Book with ISBN: " + removeBookRequest.ISBN);
    io:println("Updated List of Available Books:");
    foreach var book in removeBookResponse.books {
        io:println("Title: " + book.title + ", Author: " + book.author + ", ISBN: " + book.ISBN);
    }

    // 9. List Borrowed Books
    EmptyRequest listBorrowedBooksRequest = {};
    var listBorrowedBooksResponse = check ep->ListBorrowedBooks(listBorrowedBooksRequest);
    io:println("Borrowed Books:");
    foreach var book in listBorrowedBooksResponse.books {
        io:println("Title: " + book.title + ", Author: " + book.author + ", ISBN: " + book.ISBN);
    }
}
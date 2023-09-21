import ballerina/io;

LibraryServiceClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    EmptyRequest getAvailableBooksRequest = {};
    BookListResponse getAvailableBooksResponse = check ep->GetAvailableBooks(getAvailableBooksRequest);
    io:println(getAvailableBooksResponse);

    BorrowBookRequest borrowBookRequest = {ISBN: "ballerina", userID: "ballerina"};
    BookResponse borrowBookResponse = check ep->BorrowBook(borrowBookRequest);
    io:println(borrowBookResponse);

    SearchBookRequest searchBookRequest = {title: "ballerina"};
    BookListResponse searchBookResponse = check ep->SearchBook(searchBookRequest);
    io:println(searchBookResponse);

    LocateBookRequest locateBookRequest = {ISBN: "ballerina"};
    BookLocationResponse locateBookResponse = check ep->LocateBook(locateBookRequest);
    io:println(locateBookResponse);

    ReturnBookRequest returnBookRequest = {ISBN: "ballerina"};
    BookResponse returnBookResponse = check ep->ReturnBook(returnBookRequest);
    io:println(returnBookResponse);

    AddBookRequest addBookRequest = {title: "ballerina", author: "ballerina", ISBN: "ballerina"};
    BookResponse addBookResponse = check ep->AddBook(addBookRequest);
    io:println(addBookResponse);

    UpdateBookRequest updateBookRequest = {ISBN: "ballerina", title: "ballerina", author: "ballerina"};
    BookResponse updateBookResponse = check ep->UpdateBook(updateBookRequest);
    io:println(updateBookResponse);

    RemoveBookRequest removeBookRequest = {ISBN: "ballerina"};
    BookListResponse removeBookResponse = check ep->RemoveBook(removeBookRequest);
    io:println(removeBookResponse);

    EmptyRequest listBorrowedBooksRequest = {};
    BookListResponse listBorrowedBooksResponse = check ep->ListBorrowedBooks(listBorrowedBooksRequest);
    io:println(listBorrowedBooksResponse);
}


import ballerina/io;
import ballerina/grpc;

map<string> library = {};

// Sample books
function initLibrary() returns map<string> {
    library["12345"] = "Book1";
    library["23456"] = "Book2";
    library["34567"] = "Book3";
    return library;
}

library  = initLibrary();

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: LIBRARY_DESC}
service "LibraryService" on ep {

    remote function GetAvailableBooks(EmptyRequest value) returns BookListResponse|error {
        // Return the list of available books
        BookListResponse response;
        response.books = [];
        foreach var isbn in library.keys() {
            Book bookRecord;
            bookRecord.title = <string>library [isbn];
            bookRecord.author = "Unknown"; // You can set the author as needed.
            bookRecord.ISBN = isbn;
            response.books.push(bookRecord);
        }
        return response;
    }

    remote function BorrowBook(BorrowBookRequest value) returns BookResponse|error {
        string? requestedISBN = value.ISBN;
        if (requestedISBN != null) {
            // Check if the book exists and is available
            if (library.hasKey(requestedISBN) && library[requestedISBN] != "Borrowed") {
                // Mark the book as borrowed
                library[requestedISBN] = "Borrowed";
                // Return the ISBN of the borrowed book
                BookResponse response;
                response.ISBN = requestedISBN;
                return response;
            } else {
                // Book not available for borrowing
                return error("Book not available for borrowing.");
            }
        } else {
            // Handle the case where ISBN is null
            return error("Invalid ISBN provided.");
        }
    }

    remote function SearchBook(SearchBookRequest value) returns BookListResponse|error {
        string requestedTitle = value.title;
        // Search for books with the requested title
        BookListResponse response;
        foreach var isbn in library.keys() {
            if (library[isbn] == requestedTitle) {
                Book bookRecord;
                bookRecord.title = requestedTitle;
                bookRecord.author = "Unknown"; // You can set the author as needed.
                bookRecord.ISBN = isbn;
                response.books.push(bookRecord);
            }
        }
        return response;
    }

    remote function LocateBook(LocateBookRequest value) returns BookLocationResponse|error {
        string requestedISBN = value.ISBN;
        if (library.hasKey(requestedISBN)) {
            BookLocationResponse response;
            response.location = "Shelf A"; 
            return response;
        } else {
            return error("Book not found.");
        }
    }

    remote function ReturnBook(ReturnBookRequest value) returns BookResponse|error {
        string? returnedISBN = value.ISBN;
        if (returnedISBN != null) {
            // Check if the book exists and is borrowed
            if (library.hasKey(returnedISBN) && library[returnedISBN] == "Borrowed") {
                // Mark the book as returned
                library[returnedISBN] = "Available";
                // Return the ISBN of the returned book
                BookResponse response;
                response.ISBN = returnedISBN;
                return response;
            } else {
                // Book cannot be returned
                return error("Book cannot be returned.");
            }
        } else {
            // Handle the case where ISBN is null
            return error("Invalid ISBN provided.");
        }
    }

    remote function AddBook(AddBookRequest value) returns BookResponse|error {
        string newISBN = value.ISBN;
        string newTitle = value.title;
        if (!library.hasKey(newISBN)) {
            // Add the new book to the library
            library[newISBN] = newTitle;
            // Return the ISBN of the added book
            BookResponse response;
            response.ISBN = newISBN;
            return response;
        } else {
            // Book with the same ISBN already exists
            return error("Book with the same ISBN already exists.");
        }
    }

    remote function UpdateBook(UpdateBookRequest value) returns BookResponse|error {
        string existingISBN = value.ISBN;
        string updatedTitle = value.title;
        if (library.hasKey(existingISBN)) {
            // Update the title of the existing book
            library[existingISBN] = updatedTitle;
            // Return the ISBN of the updated book
            BookResponse response;
            response.ISBN = existingISBN;
            return response;
        } else {
            // Book with the provided ISBN not found
            return error("Book not found.");
        }
    }

    remote function RemoveBook(RemoveBookRequest value) returns BookListResponse|error {
        string removedISBN = value.ISBN;
        if (library.hasKey(removedISBN)) {
            // Remove the book from the library
            string remove = library.remove(removedISBN);
            // Return the list of remaining books
            BookListResponse response;
            response.books = [];
            foreach var isbn in library.keys() {
                Book bookRecord;
                bookRecord.title = <string>library[isbn];
                bookRecord.author = "Unknown"; // You can set the author as needed.
                bookRecord.ISBN = isbn;
                response.books.push(bookRecord);
            }
            return response;
        } else {
            // Book with the provided ISBN not found
            return error("Book not found.");
        }
    }

    remote function ListBorrowedBooks(EmptyRequest value) returns BookListResponse|error {
        // Return the list of borrowed books
        BookListResponse response;
        response.books = [];
        foreach var isbn in library.keys() {
            if (library[isbn] == "Borrowed") {
                Book bookRecord;
                bookRecord.title = "Unknown"; // Title not provided for borrowed books
                bookRecord.author = "Unknown"; // Author not provided for borrowed books
                bookRecord.ISBN = isbn;
                response.books.push(bookRecord);
            }
        }
        return response;
    }
}
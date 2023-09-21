import ballerina/grpc;
import ballerina/protobuf;

public const string LIBRARY_DESC = "0A0D6C6962726172792E70726F746F12076C696272617279220E0A0C456D7074795265717565737422680A04426F6F6B12140A057469746C6518012001280952057469746C6512160A06617574686F721802200128095206617574686F7212120A044953424E18032001280952044953424E121E0A0A6973426F72726F776564180420012808520A6973426F72726F77656422220A0C426F6F6B526573706F6E736512120A044953424E18012001280952044953424E22370A10426F6F6B4C697374526573706F6E736512230A05626F6F6B7318012003280B320D2E6C6962726172792E426F6F6B5205626F6F6B73223F0A11426F72726F77426F6F6B5265717565737412120A044953424E18012001280952044953424E12160A06757365724944180220012809520675736572494422290A11536561726368426F6F6B5265717565737412140A057469746C6518012001280952057469746C6522270A114C6F63617465426F6F6B5265717565737412120A044953424E18012001280952044953424E22270A1152657475726E426F6F6B5265717565737412120A044953424E18012001280952044953424E22520A0E416464426F6F6B5265717565737412140A057469746C6518012001280952057469746C6512160A06617574686F721802200128095206617574686F7212120A044953424E18032001280952044953424E22550A11557064617465426F6F6B5265717565737412120A044953424E18012001280952044953424E12140A057469746C6518022001280952057469746C6512160A06617574686F721803200128095206617574686F7222270A1152656D6F7665426F6F6B5265717565737412120A044953424E18012001280952044953424E22320A14426F6F6B4C6F636174696F6E526573706F6E7365121A0A086C6F636174696F6E18012001280952086C6F636174696F6E32EF040A0E4C6962726172795365727669636512450A11476574417661696C61626C65426F6F6B7312152E6C6962726172792E456D707479526571756573741A192E6C6962726172792E426F6F6B4C697374526573706F6E7365123F0A0A426F72726F77426F6F6B121A2E6C6962726172792E426F72726F77426F6F6B526571756573741A152E6C6962726172792E426F6F6B526573706F6E736512430A0A536561726368426F6F6B121A2E6C6962726172792E536561726368426F6F6B526571756573741A192E6C6962726172792E426F6F6B4C697374526573706F6E736512470A0A4C6F63617465426F6F6B121A2E6C6962726172792E4C6F63617465426F6F6B526571756573741A1D2E6C6962726172792E426F6F6B4C6F636174696F6E526573706F6E7365123F0A0A52657475726E426F6F6B121A2E6C6962726172792E52657475726E426F6F6B526571756573741A152E6C6962726172792E426F6F6B526573706F6E736512390A07416464426F6F6B12172E6C6962726172792E416464426F6F6B526571756573741A152E6C6962726172792E426F6F6B526573706F6E7365123F0A0A557064617465426F6F6B121A2E6C6962726172792E557064617465426F6F6B526571756573741A152E6C6962726172792E426F6F6B526573706F6E736512430A0A52656D6F7665426F6F6B121A2E6C6962726172792E52656D6F7665426F6F6B526571756573741A192E6C6962726172792E426F6F6B4C697374526573706F6E736512450A114C697374426F72726F776564426F6F6B7312152E6C6962726172792E456D707479526571756573741A192E6C6962726172792E426F6F6B4C697374526573706F6E7365620670726F746F33";

public isolated client class LibraryServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, LIBRARY_DESC);
    }

    isolated remote function GetAvailableBooks(EmptyRequest|ContextEmptyRequest req) returns BookListResponse|grpc:Error {
        map<string|string[]> headers = {};
        EmptyRequest message;
        if req is ContextEmptyRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/GetAvailableBooks", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookListResponse>result;
    }

    isolated remote function GetAvailableBooksContext(EmptyRequest|ContextEmptyRequest req) returns ContextBookListResponse|grpc:Error {
        map<string|string[]> headers = {};
        EmptyRequest message;
        if req is ContextEmptyRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/GetAvailableBooks", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookListResponse>result, headers: respHeaders};
    }

    isolated remote function BorrowBook(BorrowBookRequest|ContextBorrowBookRequest req) returns BookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBookRequest message;
        if req is ContextBorrowBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/BorrowBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookResponse>result;
    }

    isolated remote function BorrowBookContext(BorrowBookRequest|ContextBorrowBookRequest req) returns ContextBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBookRequest message;
        if req is ContextBorrowBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/BorrowBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookResponse>result, headers: respHeaders};
    }

    isolated remote function SearchBook(SearchBookRequest|ContextSearchBookRequest req) returns BookListResponse|grpc:Error {
        map<string|string[]> headers = {};
        SearchBookRequest message;
        if req is ContextSearchBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/SearchBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookListResponse>result;
    }

    isolated remote function SearchBookContext(SearchBookRequest|ContextSearchBookRequest req) returns ContextBookListResponse|grpc:Error {
        map<string|string[]> headers = {};
        SearchBookRequest message;
        if req is ContextSearchBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/SearchBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookListResponse>result, headers: respHeaders};
    }

    isolated remote function LocateBook(LocateBookRequest|ContextLocateBookRequest req) returns BookLocationResponse|grpc:Error {
        map<string|string[]> headers = {};
        LocateBookRequest message;
        if req is ContextLocateBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/LocateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookLocationResponse>result;
    }

    isolated remote function LocateBookContext(LocateBookRequest|ContextLocateBookRequest req) returns ContextBookLocationResponse|grpc:Error {
        map<string|string[]> headers = {};
        LocateBookRequest message;
        if req is ContextLocateBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/LocateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookLocationResponse>result, headers: respHeaders};
    }

    isolated remote function ReturnBook(ReturnBookRequest|ContextReturnBookRequest req) returns BookResponse|grpc:Error {
        map<string|string[]> headers = {};
        ReturnBookRequest message;
        if req is ContextReturnBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/ReturnBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookResponse>result;
    }

    isolated remote function ReturnBookContext(ReturnBookRequest|ContextReturnBookRequest req) returns ContextBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        ReturnBookRequest message;
        if req is ContextReturnBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/ReturnBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookResponse>result, headers: respHeaders};
    }

    isolated remote function AddBook(AddBookRequest|ContextAddBookRequest req) returns BookResponse|grpc:Error {
        map<string|string[]> headers = {};
        AddBookRequest message;
        if req is ContextAddBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/AddBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookResponse>result;
    }

    isolated remote function AddBookContext(AddBookRequest|ContextAddBookRequest req) returns ContextBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        AddBookRequest message;
        if req is ContextAddBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/AddBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookResponse>result, headers: respHeaders};
    }

    isolated remote function UpdateBook(UpdateBookRequest|ContextUpdateBookRequest req) returns BookResponse|grpc:Error {
        map<string|string[]> headers = {};
        UpdateBookRequest message;
        if req is ContextUpdateBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/UpdateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookResponse>result;
    }

    isolated remote function UpdateBookContext(UpdateBookRequest|ContextUpdateBookRequest req) returns ContextBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        UpdateBookRequest message;
        if req is ContextUpdateBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/UpdateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookResponse>result, headers: respHeaders};
    }

    isolated remote function RemoveBook(RemoveBookRequest|ContextRemoveBookRequest req) returns BookListResponse|grpc:Error {
        map<string|string[]> headers = {};
        RemoveBookRequest message;
        if req is ContextRemoveBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/RemoveBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookListResponse>result;
    }

    isolated remote function RemoveBookContext(RemoveBookRequest|ContextRemoveBookRequest req) returns ContextBookListResponse|grpc:Error {
        map<string|string[]> headers = {};
        RemoveBookRequest message;
        if req is ContextRemoveBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/RemoveBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookListResponse>result, headers: respHeaders};
    }

    isolated remote function ListBorrowedBooks(EmptyRequest|ContextEmptyRequest req) returns BookListResponse|grpc:Error {
        map<string|string[]> headers = {};
        EmptyRequest message;
        if req is ContextEmptyRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/ListBorrowedBooks", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookListResponse>result;
    }

    isolated remote function ListBorrowedBooksContext(EmptyRequest|ContextEmptyRequest req) returns ContextBookListResponse|grpc:Error {
        map<string|string[]> headers = {};
        EmptyRequest message;
        if req is ContextEmptyRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/ListBorrowedBooks", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookListResponse>result, headers: respHeaders};
    }
}

public client class LibraryServiceBookListResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBookListResponse(BookListResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBookListResponse(ContextBookListResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBookResponse(BookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBookResponse(ContextBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceBookLocationResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBookLocationResponse(BookLocationResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBookLocationResponse(ContextBookLocationResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextBookListResponse record {|
    BookListResponse content;
    map<string|string[]> headers;
|};

public type ContextBookResponse record {|
    BookResponse content;
    map<string|string[]> headers;
|};

public type ContextLocateBookRequest record {|
    LocateBookRequest content;
    map<string|string[]> headers;
|};

public type ContextSearchBookRequest record {|
    SearchBookRequest content;
    map<string|string[]> headers;
|};

public type ContextRemoveBookRequest record {|
    RemoveBookRequest content;
    map<string|string[]> headers;
|};

public type ContextUpdateBookRequest record {|
    UpdateBookRequest content;
    map<string|string[]> headers;
|};

public type ContextBorrowBookRequest record {|
    BorrowBookRequest content;
    map<string|string[]> headers;
|};

public type ContextAddBookRequest record {|
    AddBookRequest content;
    map<string|string[]> headers;
|};

public type ContextEmptyRequest record {|
    EmptyRequest content;
    map<string|string[]> headers;
|};

public type ContextReturnBookRequest record {|
    ReturnBookRequest content;
    map<string|string[]> headers;
|};

public type ContextBookLocationResponse record {|
    BookLocationResponse content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookResponse record {|
    string ISBN = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookListResponse record {|
    Book[] books = [];
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type LocateBookRequest record {|
    string ISBN = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type SearchBookRequest record {|
    string title = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type RemoveBookRequest record {|
    string ISBN = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type Book record {|
    string title = "";
    string author = "";
    string ISBN = "";
    boolean isBorrowed = false;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type UpdateBookRequest record {|
    string ISBN = "";
    string title = "";
    string author = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BorrowBookRequest record {|
    string ISBN = "";
    string userID = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type AddBookRequest record {|
    string title = "";
    string author = "";
    string ISBN = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type EmptyRequest record {|
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type ReturnBookRequest record {|
    string ISBN = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookLocationResponse record {|
    string location = "";
|};


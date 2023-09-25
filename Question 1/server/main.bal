import ballerina/uuid;
import ballerina/http;
import ballerina/io;

type CourseInfo record {
    readonly string courseCode;
    string courseName;
    string courseNQFLevel;
    string courseDepartment;
};

type LecturerInfo record {
    readonly string staffNumber;
    string staffName;
    string staffTitle;
    string courseCode;
    string officeNumber;
};

type AddCourseInfo record {
    readonly string courseId;
    string staffNumber;
    string courseCode;
};

type AddLecturerInfo record {
    readonly string lecturerId;
    string staffNumber;
    string courseCode;
    string officeNumber;
};

table<CourseInfo> key(courseCode) coursesData = table [];
table<LecturerInfo> key(staffNumber) lecturersData = table [];

table<AddCourseInfo> key(courseId) addedCoursesData = table [];
table<AddLecturerInfo> key(lecturerId) addedLecturersData = table [];

service / on new http:Listener(9090) {
    resource function post createCourse(CourseInfo newCourse) returns string|error {
        error? createCourseError = coursesData.add(newCourse);
        if createCourseError is error {
            return error("Failed to create a new course!");
        }
        return newCourse.courseName + " course created successfully.";
    }

    resource function put updateCourse(CourseInfo updatedCourse) returns string|error {
        error? updateCourseError = coursesData.put(updatedCourse);
        if updateCourseError is error {
            return error("Failed to update course details!");
        }
        return updatedCourse.courseName + " course updated successfully.";
    }

    resource function post createLecturer(LecturerInfo newLecturer) returns string|error {
        error? createLecturerError = lecturersData.add(newLecturer);
        if createLecturerError is error {
            return error("Failed to create a new lecturer!");
        }
        return newLecturer.staffName + " lecturer created successfully.";
    }

    resource function put updateLecturer(LecturerInfo updatedLecturer) returns string|error {
        error? updateLecturerError = lecturersData.put(updatedLecturer);
        if updateLecturerError is error {
            return error("Failed to update lecturer details!");
        }
        return updatedLecturer.staffName + " lecturer updated successfully.";
    }

    resource function delete deleteLecturerByStaffNo/[string staffNumber]() returns string|error {
        LecturerInfo|error deleteLecturer = lecturersData.remove(staffNumber);
        if deleteLecturer is error {
            return error("Failed to delete lecturer!");
        }
        return deleteLecturer.staffName + " lecturer deleted successfully.";
    }

//add course to lecturer
    resource function post addCourse(AddCourseInfo addCourseReq) returns string|error {
        string courseId = uuid:createType1AsString();
        error? addingCourseError = addedCoursesData.add(
            {
                courseId: courseId,
                staffNumber: addCourseReq.staffNumber,
                courseCode: addCourseReq.courseCode
            });
        if addingCourseError is error {
            return error("Failed to add course!");
        }
        return addCourseReq.courseCode + " added successfully.";
    }

    resource function post addLecturer(AddLecturerInfo addLecturerReq) returns string|error {
        string lecturerId = uuid:createType1AsString();
        error? addingLecturerError = addedLecturersData.add(
            {
                lecturerId: lecturerId,
                staffNumber: addLecturerReq.staffNumber,
                courseCode: addLecturerReq.courseCode,
                officeNumber: addLecturerReq.officeNumber
            });
        if addingLecturerError is error {
            return error("Failed to add lecturer!");
        }
        return addLecturerReq.staffNumber + " added successfully.";
    }

    resource function get retrieveAllLecturersFaculty() returns table<LecturerInfo> key(staffNumber) {
        return lecturersData;
    }

    resource function get retrieveLecturerById/[string staffNumber]() returns LecturerInfo {
        LecturerInfo theLecturer = lecturersData.get(staffNumber);
        return theLecturer;
    }

    resource function get retrieveLecturerByCourse() returns string|error {
        var getLecturer = from var lecturer in lecturersData
            join var getLecturer in addedLecturersData 
            on lecturer.staffNumber equals getLecturer.staffNumber
            join var course in coursesData 
            on getLecturer.courseCode equals course.courseCode
            select {
                staffNumber: lecturer.staffNumber,
                staffName: lecturer.staffName,
                staffTitle: lecturer.staffTitle,
                courseCode: lecturer.courseCode,
                officeNumber: lecturer.officeNumber
            };
        io:println("Lecturers that teach same course: ", getLecturer);
        return "Test functions retrieved successfully.";
    }

    resource function get retrieveLecturerByOfficeNo() returns string|error {
        var getOffice = from var office in lecturersData
            join var getOffice in addedLecturersData 
            on office.staffNumber equals getOffice.staffNumber
            join var officeNo in lecturersData 
            on getOffice.officeNumber equals officeNo.officeNumber
            select {
                staffNumber: office.staffNumber,
                staffName: office.staffName,
                staffTitle: office.staffTitle,
                courseCode: office.courseCode,
                officeNumber: office.officeNumber
            };
        io:println("Lecturers that sit in the same office: ", getOffice);
        return "Test functions retrieved successfully.";
    }
}
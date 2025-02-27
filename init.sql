-- Create students table
CREATE TABLE IF NOT EXISTS students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    gender VARCHAR(10),
    date_of_birth DATE,
    phone VARCHAR(20),
    address TEXT,
    grade_level INTEGER,
    enrollment_date DATE,
    status VARCHAR(20) DEFAULT 'Active'
);

-- Create teachers table
CREATE TABLE IF NOT EXISTS teachers (
    teacher_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    gender VARCHAR(10),
    email VARCHAR(100),
    phone VARCHAR(20),
    department VARCHAR(50),
    hire_date DATE,
    status VARCHAR(20) DEFAULT 'Active'
);

-- Create departments table
CREATE TABLE IF NOT EXISTS departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    head_teacher_id INTEGER REFERENCES teachers(teacher_id),
    office_location VARCHAR(100),
    contact_email VARCHAR(100)
);

-- Create classes table
CREATE TABLE IF NOT EXISTS classes (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    teacher_id INTEGER REFERENCES teachers(teacher_id),
    department_id INTEGER REFERENCES departments(department_id),
    schedule TEXT,
    room_number VARCHAR(20)
);

-- Create grades table
CREATE TABLE IF NOT EXISTS grades (
    grade_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    class_id INTEGER REFERENCES classes(class_id),
    first_quarter NUMERIC(5,2),
    second_quarter NUMERIC(5,2),
    third_quarter NUMERIC(5,2),
    fourth_quarter NUMERIC(5,2),
    grade_date DATE,
    UNIQUE(student_id, class_id)
);

-- Create attendance table
CREATE TABLE IF NOT EXISTS attendance (
    attendance_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    class_id INTEGER REFERENCES classes(class_id),
    attendance_date DATE,
    status VARCHAR(20),
    UNIQUE(student_id, class_id, attendance_date)
);

-- Insert sample students
INSERT INTO students (first_name, last_name, middle_name, gender, date_of_birth, phone, address, grade_level, enrollment_date) VALUES
('John', 'Smith', 'Robert', 'Male', '2008-05-15', '123-456-7890', '123 Main St, City', 9, '2023-06-01'),
('Emma', 'Johnson', 'Marie', 'Female', '2007-08-22', '234-567-8901', '456 Oak Ave, City', 10, '2022-06-01'),
('Michael', 'Williams', 'James', 'Male', '2009-03-10', '345-678-9012', '789 Pine Rd, City', 8, '2023-06-01'),
('Sophia', 'Brown', 'Elizabeth', 'Female', '2008-11-30', '456-789-0123', '321 Elm St, City', 9, '2023-06-01'),
('David', 'Jones', 'William', 'Male', '2007-07-25', '567-890-1234', '654 Maple Dr, City', 10, '2022-06-01');

-- Insert sample teachers
INSERT INTO teachers (first_name, last_name, middle_name, gender, email, phone, department, hire_date) VALUES
('Sarah', 'Anderson', 'Jane', 'Female', 'sarah.anderson@school.com', '123-555-0101', 'Mathematics', '2020-08-15'),
('James', 'Wilson', 'Robert', 'Male', 'james.wilson@school.com', '123-555-0102', 'Science', '2019-07-20'),
('Maria', 'Garcia', 'Carmen', 'Female', 'maria.garcia@school.com', '123-555-0103', 'English', '2021-08-10'),
('Robert', 'Taylor', 'Michael', 'Male', 'robert.taylor@school.com', '123-555-0104', 'History', '2018-08-01'),
('Lisa', 'Martinez', 'Ann', 'Female', 'lisa.martinez@school.com', '123-555-0105', 'Physical Education', '2022-08-05');

-- Insert sample departments
INSERT INTO departments (department_name, head_teacher_id, office_location, contact_email) VALUES
('Mathematics', 1, 'Building A, Room 101', 'math@school.com'),
('Science', 2, 'Building B, Room 201', 'science@school.com'),
('English', 3, 'Building A, Room 102', 'english@school.com'),
('History', 4, 'Building B, Room 202', 'history@school.com'),
('Physical Education', 5, 'Gymnasium Office', 'pe@school.com');

-- Insert sample classes
INSERT INTO classes (class_name, teacher_id, department_id, schedule, room_number) VALUES
('Algebra I', 1, 1, 'Monday/Wednesday 9:00 AM', 'A101'),
('Biology', 2, 2, 'Tuesday/Thursday 10:30 AM', 'B201'),
('English Literature', 3, 3, 'Monday/Wednesday 11:00 AM', 'A102'),
('World History', 4, 4, 'Tuesday/Thursday 1:00 PM', 'B202'),
('Physical Education', 5, 5, 'Friday 10:00 AM', 'GYM');

-- Insert sample grades
INSERT INTO grades (student_id, class_id, first_quarter, second_quarter, third_quarter, fourth_quarter, grade_date) VALUES
(1, 1, 88.5, 90.0, 87.5, 91.0, '2024-03-15'),
(1, 2, 85.0, 88.0, 86.5, 89.0, '2024-03-15'),
(2, 1, 92.0, 91.5, 93.0, 94.0, '2024-03-15'),
(2, 3, 89.0, 90.5, 88.0, 91.5, '2024-03-15'),
(3, 4, 87.0, 85.5, 88.5, 86.0, '2024-03-15');

-- Insert sample attendance
INSERT INTO attendance (student_id, class_id, attendance_date, status) VALUES
(1, 1, '2024-03-01', 'Present'),
(1, 2, '2024-03-01', 'Present'),
(2, 1, '2024-03-01', 'Present'),
(2, 3, '2024-03-01', 'Absent'),
(3, 4, '2024-03-01', 'Present'),
(1, 1, '2024-03-02', 'Present'),
(1, 2, '2024-03-02', 'Late'),
(2, 1, '2024-03-02', 'Present'),
(2, 3, '2024-03-02', 'Present'),
(3, 4, '2024-03-02', 'Present'); 

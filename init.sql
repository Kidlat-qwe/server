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
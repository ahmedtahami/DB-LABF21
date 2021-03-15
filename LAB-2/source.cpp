#include<iostream>
#include<fstream>
#include"Student.h"
using namespace std;
void writeToFile(const Student& object) {
    fstream file;
    file.open("data.txt",ios::app);
    file << object.RegistrationNumber << "," << object.Name << "," << object.Program << "," << object.CGPA << "," << object.ContactNumber << endl;
    file.close();
}
void Search(string cgpa)
{
    ifstream file;
    file.open("data.txt");
    while(!file.eof())
    {

    }

}
int main()
{
    Student student;
    student.RegistrationNumber = "L1F19BSCS0139";
    student.Name = "Ahmed Naeem";
    student.Program = "BSCS";
    student.CGPA = 3.12f;
    student.ContactNumber = "03231610647";
    writeToFile(student);
    return 0;
}
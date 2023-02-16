CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
cd student-submission
if [[ -e ListExamples.java ]]
then
    echo "ListExamples.java found"
else
    echo "Error found"
    exit
fi

cp -r ../lib ./

cp ../TestListExamples.java ./
javac -cp $CPATH *.java 2>javac-error.txt
if [[ $? -eq 0 ]]
then
    echo "No Error involving javac-error.txt"
else
    echo "Error involving javac-error.txt"
    exit
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples >java-tester.txt 2>&1
if [[ $? -eq 0 ]]
then
    echo "No error"
else
    echo "ERROR!!!!"
    exit
fi
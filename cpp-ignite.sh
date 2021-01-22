echo "C++ project ignite for Linux"
read -p "Project name: " project_name
project_name=$(echo $project_name | tr -d '\r')

mkdir $project_name
cd $project_name
mkdir build
mkdir include
mkdir src

# main.cpp
cat << EOF > main.cpp
#include <iostream>

int main(int argc, char* argv[]) {
	std::cout << "Hello world!" << std::endl;
	return 0;
}
EOF

# CMakeLists.txt
cat << EOF > CMakeLists.txt
cmake_minimum_required(VERSION 3.5)
include_directories(include)
file(GLOB_RECURSE SOURCES main.cpp "src/*.cpp")
add_executable($project_name \${SOURCES})
EOF

# compile.sh
cat << EOF > compile.sh
if [ ! -d build ]
then
	mkdir build
fi
cd build
cmake ..
make
EOF
chmod +x compile.sh

# run.sh
cat << EOF > run.sh
cd build
./${project_name}
EOF
chmod +x run.sh

# .gitignore
cat << EOF > .gitignore
/build
EOF

code .

echo "C++ project ignite for Linux"
read -p "Project name: " project_name

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

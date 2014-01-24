if [ "$1" == "" ]; then
clear

echo "Informe a url base dos projetos SVN."
read url

if [ "$url" == "" ]; then
        echo -e "\e[31mDesculpe, mas preciso de uma url base de projetos. Vou cancelar a operação."
        echo -e "\e[39m"
        exit;
fi

echo "Certo, agora informe o projeto."
read project

if [ "$project" == "" ]; then
        echo -e "\e[31mDesculpe, mas preciso de um nome de projeto. Vou cancelar a operação."
        echo -e "\e[39m"
        exit;
fi

echo "Ok, tenho a url base $url e o projeto $project"

echo "Certo, agora informe o usuário SVN."
read user

if [ "$user" == "" ]; then
        echo -e "\e[31mDesculpe, mas preciso de um usuário. Vou cancelar a operação."
        echo -e "\e[39m"
        exit;
fi

echo "Baixando do SVN $url/$project"

else
        url=$1
        project=$2
        user=$3
fi

echo "Baixando do SVN $url/$project"
git-svn clone --username $user $url/$project/ $project

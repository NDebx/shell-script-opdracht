#!/bin/zsh

# Run this in your terminal if it wont run from the script
python3 -m venv env
source "./env/bin/activate"

git clone https://github.com/Rac-Software-Development/fastapi_passworder.git

cd "./fastapi_passworder"

pip3 install -r requirements.txt 
python3 -m unittest discover . 

if [ $? -eq 0 ];
then 
    echo "Successfully run the test"
else 
    echo "Failed to run the test: $?"
    echo 1;
fi

git describe --tags > "./git_nilesh_tags.txt"

cd ".."
mkdir "passworder_test"
mv "./fastapi_passworder" "passworder_test"
cd "./passworder_test/fastapi_passworder/passworder"

uvicorn main:app --reload || bash "run_wget.sh"

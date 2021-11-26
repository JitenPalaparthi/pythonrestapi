FROM python:3.8-slim-buster
# The above command is the base image

WORKDIR /app 
# the above command creates a directory called app and cd to that directory

COPY requirements.txt requirements.txt
# we do not have a requirements file but we can create one and keep all python dependencies in that .
# In our case Flask is the dependency 


RUN pip3 install -r requirements.txt
# RUN runs different commands in the docker container. Here it runs pip3 install all dependencies in the requirement.txt file

COPY . .
# The above command copies everything to the current container directory. Here container directory is app. Which was created in 2nd command.

EXPOSE 50085
# If you want to expose a specific port

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]

# The above command is the end command to the container. Similarly to bash in ubuntu image. path="python3" and args are "-m","flask","run" etc..
# since the last command runs uninterruptedly this container does not exit until by any error or force exit or remove it by any internal or external stuff

# upon creating this file 
# docker build . -t yourdockerid/somenameoftheapp
# docker push yourdockerid/somenameoftheapp 
# the above pushes to your docker registry. SO that you or any body can pull and run that image like any other image.



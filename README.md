[![Build Status](https://circleci.com/gh/y-martinez/machine-learning-microservices.svg?style=shield)](https://app.circleci.com/pipelines/github/y-martinez/machine-learning-microservices)
[![license](https://img.shields.io/github/license/y-martinez/machine-learning-microservices.svg)](https://github.com/y-martinez/machine-learning-microservices/blob/master/LICENSE)


# Machine Learning with Microservices

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).


## Files structure

> ### Application:

- `app.py` application script
- `model_data` folder with the trained model and data for prediction
- `requirements.txt` dependencies of app


> ### CI/CD:

- `.circleci/config.yml` folder with the configuration to CircleCI


> ### Outputs:

- `output_txt_files`  folder with docker and kubernetes outputs files

> ### Docker:

- `Dockerfile` use this file to deploy an image for the app to be runned on a container

> ### Utils/Tools:

- `Makefile`  useful commands to make setup, install, test, lint, run_docker, run_kubernetes, upload_docker, all
- `run_docker.sh` script to build and start container 
- `run_kubernetes.sh` script to run on Kubernetes
- `upload_docker.sh` script to upload to dockerhub container
- `make_prediction.sh` script to test application

---

## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

## Running `app.py`

You can run in different ways this app,these are Standalone, Docker or Kubernetes

1. Standalone:  `python app.py`

> You will now access the app on localhost port 80. [http://localhost:80](http://localhost:80)


2. Run in Docker:  `./utils/run_docker.sh`

The script will:
- Build an docker image
- List images to verify that this app is dockerized
- Run a container with this specified image and map port 5000 (host) to 80 (container)

> You can now access the app on localhost port 5000. [http://localhost:5000](http://localhost:5000)


3. Run in Kubernetes:  `./utils/run_kubernetes.sh`

The script will:
- Start to run a container in Kubernetes cluster (make sure to have one ready the best option to locally is use `minikube`)
- Wait for the pod to be running
- List pod to verify your pod is up
- Forward port 5000 (host) to 80 (container)

> You can now access the app on localhost port 5000. [http://localhost:5000](http://localhost:5000)

You can delete when you've finished the pod with the command `kubectl delete pod prediction` and if you use `minikube` to test locally you should clean up your resources and delete the kubernetes cluster with a call to `minikube delete` to delete it or `minikube stop` for pause it.

## Test the app

You can test this application by running the script `./utils/make_prediction.sh`, remember that depending on the input the model returns a price prediction on a house in Boston. In the script above there is a default json (you can change it) input:

```json
{  
   "CHAS":{  
      "0":0
   },
   "RM":{  
      "0":9.575
   },
   "TAX":{  
      "0":296.0
   },
   "PTRATIO":{  
      "0":15.3
   },
   "B":{  
      "0":396.9
   },
   "LSTAT":{  
      "0":4.98
   }
}
```

with the `curl` command on port 5000 (you can switch to 80 if running on the standalone way). You can test with this input but if you want change it, please remember read more about the data (parameters that you can use in an input) on Kaggle, [data source site](https://www.kaggle.com/c/boston-housing)



## Setup

* If you don’t have Python installed, [install it from here](https://www.python.org/downloads/).

* Clone this repository.

* Navigate into the project directory:

   ```bash
   cd <repo_name>
   ```

<br />

## Create a new virtual environment

<br />


### Using virtual-env [preferred over venv]  



1. [Install virtual-env](https://pypi.org/project/virtualenv/)  
```bash
pip install virtualenv
```
2. Setup virtual environment
```bash
$ virtualenv env && source env/bin/activate
```

2. Install dependencies
```bash
$ pip3 install -r requirements.txt
```


<br />

### Using venv  
_ `pyvenv` (not to be confused with pyenv) is a script shipped with Python 3.3 to 3.7. It was removed from Python 3.8 as it had problems (not to mention the confusing name). Running python3 -m venv has exactly the same effect as pyvenv.


<br /> 

1. Creating environment (and activating)  
```bash
python3 -m venv env && . env/bin/activate
```

2. Install Requirements
```bash
python3 -m pip3 install -r requirements.txt
```

<br />


### Using Docker



<br />

Build docker image
```bash
docker build -t myapp:v1 .
```

<br />

Running ephemeral container
```bash
docker run --name myapp_container -it --rm -v ./:/usr/src/app myapp:v1
``` 
Optional: `-e IP_RANGE="<ip>"` (defaults to 172.17.0.1 - docker default subnet)

<br />

Running persistent container
```bash
docker run --name myapp_container -d --rm -v ./:/usr/src/app myapp:v1 tail -f /dev/null
```

<br />

Entering into an interactive terminal session of your long-running container
```bash
docker exec -it myapp_container /bin/bash
```

<br />

## Init
1. Create a .env file with your OpenAI api key
```bash
echo "OPENAI_API_KEY={api_secret}" > .env 
```

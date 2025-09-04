# deployment with Kind & Helm
Развёртывание [podinfo](https://github.com/stefanprodan/podinfo) в локальном Kubernetes (kind) с помощью Helm.
--------------------------------------------------------------------------------------------------------------------


##Среды и окружение:
для работы необходимо установить 

- [WSL](phttps://learn.microsoft.com/en-us/windows/wsl/install?utm_source=chatgpt.com/)
- [Docker](https://docs.docker.com/get-docker/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/) 
- [kind](https://kind.sigs.k8s.io/) 
- [Helm](https://helm.sh/docs/intro/install/) 


Также требуется GitHub Personal Access Token (PAT) с правами `read:packages` / `write:packages`, если использовать приватные образы из GHCR

--------------------------------------------------------------------------------------------------------------------
1. Установтить WSL терминал в windows и интегрирвать с Docker
-  Открыть PowerShell от админа и выполнить wsl --install
-  В Docker Desktop включить “Use WSL 2 based engine” и интеграцию с Ubuntu дистрибуцией

2.  Клонирование репозитория
- git clone https://github.com/alexrelease/release-platform.git
- cd release-platform

3. Создание локального кластера kind
- kind create cluster --name demo --config kind.yaml

4. Установка podinfo через Helm
- helm --upgrade --install ./helm/podinfo -n demo --create-namespace

5. Проброс порта для доступа
- kubectl -n demo port-foward svc/podinfo 8080:9898	

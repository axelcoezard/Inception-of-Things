# Inception of Things

Mon projet Inception of Things de 42, fait avec [Alois](https://github.com/asebrech) et [Loan](https://github.com/Loan-Matarise).

## Résumé
> Ce projet a pour but de vous faire découvrir kubernetes d'un point de vue développeur. Vous allez devoir mettre en place des petits clusters et découvrir la mécanique de l'intégration continue. À la fin de ce projet vous serrez capable d'avoir un cluster fonctionnel rapidement dans docker et ainsi avoir une intégration continue utilisable pour vos applications.

## Quelques infos
- Ajouter `user` aux sudoers: `usermod -aG sudo $USER`
- Ajouter `username  ALL=(ALL) NOPASSWD:ALL` au fichier `/etc/sudoers` via `visudo`
- Changer `Port 21` en `Port 4242` dans `/etc/ssh/sshd_config` puis redemarer ssh via `service ssh restart`
- Repo a deployer: https://github.com/Kalinololo/asebrech-iot-deploy

## Quelques definitions
### Docker
Docker est un logiciel libre permettant de lancer des applications dans des conteneurs logiciels. Il a été créé par Solomon Hykes et initialement développé par la société Docker, Inc.

### Kubernetes
Kubernetes est un système open-source qui permet d'automatiser le déploiement, la montée en charge et la gestion des applications conteneurisées. Il a été conçu à l'origine par Google et est maintenant maintenu par la Cloud Native Computing Foundation. Il vise à fournir une "plate-forme permettant d'automatiser le déploiement, la montée en charge et la mise en œuvre de conteneurs d'application sur des grappes de serveurs".

### K3S
K3s est une distribution légère de Kubernetes. Elle est conçue pour les développeurs et les opérateurs qui cherchent un moyen de démarrer rapidement avec Kubernetes, ainsi que pour les projets de bordure, de l'IdO (Internet des objets) et de l'informatique embarquée où les ressources sont limitées.

### K3D
K3d est un outil léger qui permet de créer des clusters k3s dans docker, il est conçu pour les développeurs et les opérateurs qui cherchent un moyen rapide de démarrer avec Kubernetes.

### Vagrant
Vagrant est un logiciel libre et open-source pour la création et la configuration des environnements de développement virtuel. Il peut être considéré comme un wrapper autour de logiciels de virtualisation tels que VirtualBox, KVM, VMware et autour de gestionnaires de configuration comme Ansible, Chef, Salt et Puppet.

### ArgoCD
Argo CD est un outil open source qui permet de déployer des applications sur un cluster Kubernetes. Il est basé sur GitOps, ce qui signifie que toutes les opérations de déploiement sont effectuées à l'aide de Git en tant que source de vérité. Argo CD surveille les dépôts Git et, lorsqu'un changement est détecté, il déploie automatiquement les nouvelles versions des applications sur le cluster Kubernetes.

### Integration Continue
L'intégration continue est une pratique de génie logiciel consistant à vérifier à chaque modification de code source que le résultat des modifications ne produit pas de régression dans l'application développée. Elle est utilisée dans le cadre de la méthode de développement agile.


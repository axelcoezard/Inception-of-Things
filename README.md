# Inception of Things

Mon projet Inception of Things de 42, fait avec [Alois](https://github.com/asebrech) et [Loan](https://github.com/Loan-Matarise).

## Résumé
> Ce projet a pour but de vous faire découvrir kubernetes d'un point de vue développeur. Vous allez devoir mettre en place des petits clusters et découvrir la mécanique de l'intégration continue. À la fin de ce projet vous serrez capable d'avoir un cluster fonctionnel rapidement dans docker et ainsi avoir une intégration continue utilisable pour vos applications.

## Quelques infos
- Ajouter `user` aux sudoers: `usermod -aG sudo $USER`
- Ajouter `username  ALL=(ALL) NOPASSWD:ALL` au fichier `/etc/sudoers` via `visudo`
- Changer `Port 21` en `Port 4242` dans `/etc/ssh/sshd_config` puis redemarer ssh via `service ssh restart`

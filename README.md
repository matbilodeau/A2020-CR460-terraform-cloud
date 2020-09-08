# Terraform Cloud Getting Started Guide - En français sur GCP

Voici un exemple de configuration pour utiliser avec le tutoriel [Terraform Cloud Getting Started Guide](https://learn.hashicorp.com/terraform/cloud-gettingstarted/tfc_overview).  Les fichiers de base ont été modifiés pour fonctionner sur Google Cloud Platform.

## Qu'est-ce que ça fait?

C'est une configuration Terraform très simple qui va créer une [instance de VM compute engine](https://cloud.google.com/compute)  [version gratuite](https://cloud.google.com/free) liée à votre compte GCP.

Lorsque vous serez à l'étape de lier un _Workspace_ sur Terraform Cloud, vous pouvez utiliser ce repository à la place de l'original, offrant les fichiers pour AWS.  Terraform Cloud pourra donc exécuter
`terraform plan` et `terraform apply` automatiquement lorsque les modifications sont poussées. Pour plus d'information sur comment Terraform Cloud interagit avec les Version Control Systems, jetez un coup d'oeil à [la documentation VCS de Terraform](https://www.terraform.io/docs/cloud/run/ui.html).

## J'ai besoin de quoi?

Vous devez avoir un compte GCP et fournir les [authentifiants](https://www.terraform.io/docs/providers/google/guides/getting_started.html#adding-credentials) de votre compte de service à Terraform Cloud. Terraform Cloud chiffre et enregistre les variables avec [Vault](https://www.vaultproject.io/). Pour plus d'information sur comment enregistrer des variables dans Terraform Cloud référez-vous à la [documentation sur les variables](https://www.terraform.io/docs/cloud/workspaces/variables.html).  

Vous devez remplacer `mon-projet` dans variables.tf par votre ID de projet GCP.

Pour les authentifiants, utilisez une variable d'environnement nommée `GOOGLE_CREDENTIALS` et marquez son contenu "Sensitive" dans votre _Workspace_

Pour la section sur les [changements de variables](https://learn.hashicorp.com/tutorials/terraform/cloud-change#changing-variables), vous pouvez changer la [zone](https://cloud.google.com/compute/docs/regions-zones?hl=fr)

## Ça me donne toujours des erreurs!
TLDR: Ouvrez la console développeur de votre navigateur
    `console.log(JSON.stringify(collez_le_contenu_JSON_ici))`  puis copiez/collez le résultat dans la variable.

Le fichier .json doit être modifié pour être enregistré dans la variable et doit être contenu en une seule ligne.  Il semble toutefois y avoir un [problème](https://github.com/hashicorp/terraform/issues/22796) avec le contenu des variables et les `\n`; reformater le .json manuellement ne fonctionne pas pour tout le monde.

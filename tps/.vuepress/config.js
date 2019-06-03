module.exports = {
    title: "Dockerisez vos tests d’intégration",
    description: "Mise en place de testcontainers pour l'application Spring Petclinic",
    base: "/handson-testcontainers/",
    port: 3000,
    dest: 'docs',
    themeConfig: {
        // Assumes GitHub. Can also be a full GitLab url.
        repo: 'vgallet/handson-testcontainers',
        // defaults to false, set to true to enable
        editLinks: true,
        // custom text for edit link. Defaults to "Edit this page"
        editLinkText: 'Help us improve this page!',
        // if your docs are not at the root of the repo:
        docsDir: 'tps',
        sidebar: [
            '/GETTING_STARTED',
            '/ARCHITECTURE',
            '/MYSQL_CONTAINER'
        ]
    }
};

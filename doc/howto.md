# Hugo with Github Pages and Actions

- choose a theme like:

  - https://themes.gohugo.io/theme/SimpleIntro/
  - https://themes.gohugo.io/theme/Hargo-hugo-ecommerce-theme/
  - https://themes.gohugo.io/theme/meghna-hugo/
  - https://themes.gohugo.io/theme/hugo-scroll/

## hugo

```sh
git init
git remote add origin git@github.com:<username>/<repo-name>
git add --all
git commit -m "Commit MSG"
git push origin master

## add template
git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
git submodule update --init --recursive
git push origin master
```

## github actions

## References

- [hugo doc](https://gohugo.io/hugo-pipes/minification/)
- [releases](https://github.com/gohugoio/hugo/releases)
- [templates](https://themes.gohugo.io)
- [github pages](https://guides.github.com/features/pages)
- [markdown](https://guides.github.com/features/mastering-markdown/)
- [github pages actions](https://github.com/marketplace/actions/github-pages-action)


https://github.com/peaceiris/actions-hugo/tree/main/.github/workflows
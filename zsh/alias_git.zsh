#GIT alias
# ADD
alias ga='git add -v'
alias gaa='git add --all -v'
# Branch
alias gb='git branch'
alias gba='git branch --all'
# Status
alias gst='git status'
# Checkout
alias gch='git checkout'
alias gsw='git switch'
alias gswc='git switch -c'
# Cherry-pick
alias gcp='git cherry-pick'
alias gcpc='git cherry-pick --continue'
alias gcpa='git cherry-pick --abort'
# Clone
alias gcl='git clone'
# Commit
alias gcm='git commit -m'
alias gcma='git commit --amend -m'
alias gcman='git commit --amend --no-edit'
# Diff (usar -- para empezar a indicar nombres de archivos)
    # Directorio vs Staging (no stageados)
alias gd='git diff --color-words'
    # Staging vs HEAD (ya stageados)
alias gds='git diff --color-words --staged'
    # Directorio y Staging vs HEAD
alias gdH='git diff --color-words HEAD'
# Log
alias gl='git log --stat'
alias glo='git log --oneline'
alias glg='git log --graph --oneline'
alias glga='git log --graph --oneline --all'
# Merge
    # --no-ff obliga a crear siempre commit de fusion
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gms='git merge --squash'
alias gmff='git merge --ff-only'
# Rebase
alias grb='git rebase --autostash'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
# Pull
alias gpl='git pull'
alias gplr='git pull --rebase --autostash'
# Push
alias gp='git push'
alias gpd='git push --dry-run'
# Remote
alias grao='git remote add origin'
# Reset
    # mixed (por defecto) conserva los cambios pero fuera del area de stagin
    # soft conserva los cambios en el area de staging
    # hard no conserva ningun cambio
    # keep conserva los cambios que aun no guardaste
alias gr='git reset'
# Clean (elimina archivos untracked)
alias gclean='git clean -d -f'
alias gcleand='git clean -d --dry-run'
# Revert
alias grev='git revert'
# Rm
    # rm borra de todo, cached lo saca del rastreo de git
alias grm='git rm'
alias grmc='git rm --cached'

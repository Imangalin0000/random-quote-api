# Random Quote API

A small HTTP service that returns random quotes.

## What it does
Provides endpoints to check health and get a random quote.

## How to run it
```bash
./scripts/run.sh
```
The service runs on port 8080 by default, but it can be overridden with the PORT environment variable.
## How to test it 
```bash
./scripts/test.sh
```

## Rollback

Argo CD deploys what is on the `main` branch, from the `k8s` folder.
To roll back, undo the commit that deployed the bad version, with a new commit:

    git log --oneline -- k8s
    git revert <commit>
    git push

Argo CD deploys the previous version within three minutes. Do not use
`kubectl rollout undo`: self-heal would put the bad version back.

git hooks
=========

These are my git hooks. You can find a command to update these in the /bin
directory of this repo.

## Layout and structure

```
.git/hooks/
|--- python/
|--- javascript/
|--- php/
|    |--- composer/
|    |    |--- pre-commit
|    |--- phpcs/
|    |    |--- pre-commit
|    |--- phpmd/
|    |    |--- pre-commit
|    |--- pre-commit
|--- pre-commit
```

In this example, /pre-commit will call all the language specific pre-commit
hooks. Those in turn will call the various tools pre-commit hooks.

## Configuration

hooks.php.enabled = true
hooks.php.phpcs.enabled = true
hooks.php.phpmd.enabled = true
hooks.php.composer.enabled = true
hooks.php.composer.bin = ~/bin/composer.phar

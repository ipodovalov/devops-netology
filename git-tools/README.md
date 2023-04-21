> Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.  

Ответ:
```
✔ ~/tmp/terraform [main|✔]                                    
14:38 $ git show aefea                                        
commit aefead2207ef7e2aa5dc81a34aedf0cad4c32545               
Author: Alisdair McDiarmid <alisdair@users.noreply.github.com>
Date:   Thu Jun 18 10:29:58 2020 -0400                        
                                                              
    Update CHANGELOG.md                                       
```
___

> Какому тегу соответствует коммит `85024d3`? 

Ответ: `git log -1 85024d3`:
```shell
tag: v0.12.23
#или `git tag --points-at 85024d3`:
v0.12.23
```

---

> Сколько родителей у коммита `b8d720`? Напишите их хеши.

Ответ: ` git cat-file -p b8d720 | grep parent`:
```shell
parent 56cd7859e05c36c06b56d013b55a252d0bb7e158
parent 9ea88f22fc6269854151c571162c5bcf958bee2b
```

---

> Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами  v0.12.23 и v0.12.24.

Ответ: `git log v0.12.23..v0.12.24 --pretty=format:"%H comment: %s"`:
```shell
33ff1c03bb960b332be3af2e333462dde88b279e comment: v0.12.24
b14b74c4939dcab573326f4e3ee2a62e23e12f89 comment: [Website] vmc provider links
3f235065b9347a758efadc92295b540ee0a5e26e comment: Update CHANGELOG.md
6ae64e247b332925b872447e9ce869657281c2bf comment: registry: Fix panic when server is unreachable
5c619ca1baf2e21a155fcdb4c264cc9e24a2a353 comment: website: Remove links to the getting started guide's old location
06275647e2b53d97d4f0a19a0fec11f6d69820b5 comment: Update CHANGELOG.md
d5f9411f5108260320064349b757f55c09bc4b80 comment: command: Fix bug when using terraform login on Windows
4b6d06cc5dcb78af637bbb19c198faff37a066ed comment: Update CHANGELOG.md
dd01a35078f040ca984cdd349f18d0b67e486c35 comment: Update CHANGELOG.md
225466bc3e5f35baa5d07197bbc079345b77525e comment: Cleanup after v0.12.23 release
```

---

> Найдите коммит, в котором была создана функция `func providerSource`, её определение в коде выглядит так: `func providerSource(...)` (вместо троеточия перечислены аргументы).

Ответ: `git log --patch` и поиском нагрепал где добавили эту функцию:
```shell
commit 5af1e6234ab6da412fb8637393c5a17a1b293663
Author: Martin Atkins <mart@degeneration.co.uk>
Date:   Tue Apr 21 16:28:59 2020 -0700

    main: Honor explicit provider_installation CLI config when present
    
    If the CLI configuration contains a provider_installation block then we'll
    use the source configuration it describes instead of the implied one we'd
    build otherwise.
```

---

> Найдите все коммиты, в которых была изменена функция `globalPluginDirs`.

Ответ: `git log -S globalPluginDirs --all --pretty=format:"%H"`:

---

> Кто автор функции `synchronizedWriters`?
Ответ:
```shell
git log -S synchronizedWriters --stat
git checkout 5ac311e2a91e381e2f52234668b49ba670aa0fe5
git blame -- synchronized_writers.go | grep "func synchronizedWriters"
5ac311e2a91 (Martin Atkins 2017-05-03 16:25:41 -0700 15) func synchronizedWriters(targets ...io.Writer) []io.Writer {
```

---
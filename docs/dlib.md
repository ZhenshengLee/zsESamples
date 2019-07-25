# zsLearn

## dlib-apt安装

* apt install

```shell
sudo apt install libdlib-dev
```

* 解决ubuntu Bug

```shell
# This can be solved by removing the line
# list(APPEND _IMPORT_CHECK_FILES_FOR_dlib::dlib "${_IMPORT_PREFIX}/lib/libdlib.a" )
# from /usr/lib/cmake/dlib/dlib-none.cmake
sudo gedit /usr/lib/cmake/dlib/dlib-none.cmake
```

## 使用vscode

* 安装[vscode](https://code.visualstudio.com/ )

* 安装下列插件：

```shell
cmake
cmake-tools
code-settings-sync
cpptools
```

## 复制此目录，使用cmake编译使用示例程序
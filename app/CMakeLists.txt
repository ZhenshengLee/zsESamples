# 在此处添加定义，包含要编译的app
# app 中存放应用，一般情况下只有一个main 文件和一个test 文件即可
# 特殊情况下可以有模块文件，cmake list 也要支持
# 也可以做成默认所有子文件夹，然后由用户减掉或者直接设定变量
add_subdirectory("./example/tddTest")
# hitsz-statistics-and-data-analysis

## 概率和数理统计实验

本仓库用于存放随课程进度完成的概率和数理统计实验报告。

## 文件夹说明

- `src` 文件夹用于存放程序代码，运行实验时请打开其中的 `.m` 文件。
- `export` 文件夹中的 `.mlx` 文件仅用于导出为 Word，方便写实验报告时将源代码粘贴到 Word 文档中；对应的 Word 文档也存放在 `export` 文件夹中。

## 运行代码注意事项

> [!IMPORTANT]
> 如果想要运行代码，一定要打开 `src` 文件夹中的 `.m` 文件，并确认 MATLAB 左侧面板的当前路径为：
>
> ```text
> .../Experiment_n/src
> ```

> [!WARNING]
> 不要在 `export` 文件夹中运行代码，也不要直接运行其中的 `.mlx` 文件。
>
> 如果 MATLAB 当前路径中包含 `export` 文件夹，或者打开的是 `export` 文件夹中的 `.mlx` 文件，可能会导致 `src` 中的 `.m` 文件无法正常运行。

## 常见报错

如果出现类似报错：

```text
MATLAB 无法运行该文件，因为 MATLAB 路径中存在 .../Experiment_1/Task1.mlx，导致该文件被遮蔽。
```

多半是由于以上原因。

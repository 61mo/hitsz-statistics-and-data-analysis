# HITSZ Statistics and Data Analysis

# 概率和数理统计实验

本仓库用于整理哈尔滨工业大学（深圳）概率和数理统计课程的实验代码、MATLAB Live Script 导出文件和实验报告文档。

仓库内容以课程实验为主，主要包括 MATLAB 源代码、Live Script 文件、Word 导出文件以及实验报告，方便进行课程学习、实验复习和版本管理。

## Repository Structure

```text
hitsz-statistics-and-data-analysis/
├── README.md
└── Experiment_m/
    ├── src/
    │   └── Taskn.m 实验任务对应的 MATLAB 源代码文件
    │
    ├── export/ 由 MATLAB Live Script 导出的 .mlx 文件和对应的 Word 文档
    │   ├── Taskn.mlx .mlx 文件仅用于导出为 Word
    │   └── Taskn.docx 由 .mlx 文件导出的Word文档，便于将源代码粘贴到实验报告 Word 文档中
    │
    ├── Experiment_m_Report.docx
    └── Experiment_m_Report.pdf
```

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
MATLAB 无法运行该文件，因为 MATLAB 路径中存在 .../Experiment_m/Taskn.mlx，导致该文件被遮蔽。
```

多半是由于以上原因。

### 解决方法：

1. 关闭当前打开的 `.mlx` 文件；
2. 回到对应实验的 `src` 文件夹；
3. 打开并运行 `src` 文件夹中的 `.m` 文件；
4. 确认 MATLAB 当前路径中不包含 `export` 文件夹。

---

## License

本仓库仅用于课程学习与个人实验整理。

如需参考其中内容，请遵守课程要求与学术诚信规范。

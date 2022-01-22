---
title: "Robust Plant Segmentation of Color Images Based on Image Contrast Optimization"
authors: 
- Y. Lu 
- Sierra Young
date: "2022-01-11"
# doi: ""

# Schedule page publish date (NOT publication's date).
publishDate: "2022-01-11T00:00:00Z"

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["2"]

# Publication name and optional abbreviated publication name.
publication: "*Computers and Electronics in Agriculture (accepted)*"

abstract: Plant segmentation is a crucial task in computer vision applications for identification/classification and quantification of plant phenotypic features. Robust segmentation of plants is challenged by a variety of factors such as unstructured background, variable illumination, biological variations, and weak plant-background contrast. Existing color indices that are empirically developed in specific applications may not adapt robustly to varying imaging conditions. This study proposes a new method for robust, automatic segmentation of plants from background in color (red-green-blue, RGB) images. This method consists of unconstrained optimization of a linear combination of RGB component images to enhance the contrast between plant and background regions, followed by automatic thresholding of the contrast-enhanced images (CEIs). The validity of this method was demonstrated using five plant image datasets acquired under different field or indoor conditions, with a total of 329 color images as well as ground-truth plant masks. The CEIs along with 10 common index images were evaluated in terms of image contrast and plant segmentation accuracy. The CEIs that were based on the maximized foreground-background separability achieved consistent, substantial improvements in image contrast over the index images, and resulted in an average segmentation accuracy of F1=95%, which is 4% better than the best accuracy obtained by the indices. The index images were found to sensitive to imaging conditions and none of them performed robustly across the datasets. The proposed method is straightforward, easy to implement and can be extended to nonlinear forms of color component combinations or other color spaces and generally useful in plant image analysis for precision agriculture and plant phenotyping.

# links:
# url_pdf: 
---

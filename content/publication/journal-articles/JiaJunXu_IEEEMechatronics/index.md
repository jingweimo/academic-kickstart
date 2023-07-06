---
title: "Optimal sampling-based path planning for mobile cable-driven parallel robots in highly constrained environment"
authors: 
- Jiajun Xu
- Byeong-Geon Kim
- Y. Lu
- Kyoung-Su Park
date: "2023-06-30"
doi: "https://doi.org/10.1007/s40747-023-01114-3"

# Schedule page publish date (NOT publication's date).
publishDate: "2023-06-30T00:00:00Z"

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["2"]

# Publication name and optional abbreviated publication name.
publication: "Complex & Intelligent Systems"

abstract: Mobile cable-driven parallel robots (MCDPRs) is a novel concept of cable-driven parallel robots (CDPRs) developed by mounting several mobile bases to discrete the conventional fixed frame. However, the additional mobile bases introduce more degree-of-freedom (DoF), thereby causing the kinematic redundancy. Moreover, mobile bases are susceptible to disturbances causing inconsistent performance. Hence, path planning of MCDPRs becomes a challenging issue due to various internal and external constraints involved. In this article, an optimization-based path planning method is proposed for MCDPRs in highly constrained environments with considering kinematic stability. The proposed approach quickly generates feasible paths for coupled mobile bases by using the developed multi-agent rapidly exploring random tree (MA-RRT). In this process, the tree can share information through the heuristics method to optimize the path, and the adaptive sampling strategy is thus proposed to increase the tree growth efficiency by self-adjusting sampling space. Moreover, the developed dynamic control checking method (DCC) is integrated with MA-RRT to smooth the path and the kinodynamic constraints of mobile bases can be satisfied. To generate the path of the end-effector, two performance metrics are designed considering the kinematic and stability of the MCDPR. Based on the performance metrics, the grid-based search method is developed to generate the path for the end-effector. Finally, the convincing performance of the proposed method is revealed through the dynamic simulation software (CoppeliaSim) and real-world experiments based on a self-built MCDPR prototype.

# links: 
url_pdf: https://link.springer.com/article/10.1007/s40747-023-01114-3
# url_dataset:
# url_code: 

---

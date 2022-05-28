---
title: "Performance Evaluation of Deep Transfer Learning on Multiclass Identification of Common Weed Species in Cotton Production Systems"
authors: 
- D. Chen
- Y. Lu* 
- Z. Li
- S. Young
date: "2022-05-24"
doi: ""

# Schedule page publish date (NOT publication's date).
publishDate: "2022-05-24T00:00:00Z"

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["2"]

# Publication name and optional abbreviated publication name.
publication: "*Computers and Electronics in Agriculture (accepted)*"

abstract: Precision weed management offers a promising solution for sustainable cropping systems through the use of chemical-reduced/non-chemical robotic weeding techniques, which apply suitable control tactics to individual weeds. Therefore, accurate identification of weed species plays a crucial role in such systems to enable precise, individualized weed treatment. Despite recent progress, the development of a robust weed identification and localization system in the presence of unstructured field conditions remains a serious challenge, requiring supervised modeling using large volumes of annotated data. This paper makes a first comprehensive evaluation of deep transfer learning (DTL) for identifying common weed species specific to cotton (Gossypium hirsutum L.) production systems in southern United States. A new dataset for weed identification was created, consisting of 5187 color images of 15 weed classes collected under natural lighting conditions and at varied weed growth stages, in cotton fields (primarily in Mississippi and North Carolina) during the 2020 and 2021 field seasons. We evaluated 35 state-of-the-art deep learning models through transfer learning with repeated holdout validations and established an extensive benchmark for the considered weed identification task. DTL achieved high classification accuracy of F1 scores exceeding 95%, requiring reasonably short training time (less than 2.5 hours) across models. ResNext101 achieved the best F1-score of 98.93 ± 0.34% whereas 10 out of the 35 models achieved F1 scores exceeding 98.0%. However, the performance on minority weed classes with few training samples was less satisfactory for models trained with a conventional, unweighted cross entropy loss function. To address this issue, a weighted cross entropy loss function was adopted, which achieved substantially improved accuracies for minority weed classes (e.g., the F1-scores for Xception and MnasNet on the Spurred Anoda weed increased from 48% to 90% and 50% to 82%, respectively). Furthermore, a deep learning-based cosine similarity metrics was employed to analyze the similarity among weed classes, assisting in the interpretation of classifications. Both the codes (https://github.com/Derekabc/CottonWeeds) for model benchmarking and the weed dataset (https://www.kaggle.com/yuzhenlu/cottonweedid15) of this study are made publicly available, which expect to be a valuable resource for future research in weed identification and beyond.

# links
url_pdf: [https://arxiv.org/abs/2110.04960https://www.researchgate.net/publication/360910153_Performance_evaluation_of_deep_transfer_learning_on_multi-class_identification_of_common_weed_species_in_cotton_production_systems]

url_code: [https://github.com/Derekabc/CottonWeeds]

# url_data: [https://www.kaggle.com/yuzhenlu/cottonweedid15]

---

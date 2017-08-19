% Looking for a word in the vocabulary list_in_columns
% using binary search

function ii = binSearch(str, vocabList, starti, endi)

    mid = ceil((endi - starti)/2) + starti;

    if strcmp(str, vocabList{mid})
      ii = mid;
      return;
    endif  
    
    if starti >= endi
       ii = -1;
       return;
    endif
    
    if (endi-starti) < 100
      ii = linearSearch(str, vocabList, starti, endi);
    endif  

    % if str is lexicographically smaller than vocabList{mid}    
    if strcmp(sort({str, vocabList{mid}})(1), str)
      endi = mid-1;
      ii = binSearch(str, vocabList, starti, endi);
    else 
      starti = mid;
      ii = binSearch(str, vocabList, starti, endi);
    endif
    
end

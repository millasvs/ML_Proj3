function ii = linearSearch(str, vocabList, starti, endi)

    for index = starti:endi      
      if strcmp(str, vocabList{index})
        ii = index;
        return;
      endif 
    end

    ii = -1;

end
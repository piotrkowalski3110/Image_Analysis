function [ResultMedian] = wagMed(InputImg, WagMask)
    ResultMedian = InputImg;
    W = [];
    for i=2:size(InputImg,2)-1
        for j=2:size(InputImg,1)-1
            for a=-1:1
                for b=-1:1
                    for c=1:length(WagMask)
                        for d=1:WagMask(c)
                            W(end+1) = InputImg(i+a,j+b);
                        end
                    end
                end
            end
            Wsort = sort(W);
            ResultMedian(i,j) = Wsort(5);
        end
    end
end


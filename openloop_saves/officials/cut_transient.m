function data_steady=cut_transient(data, to_skip)
data_steady=[];
for row=1:size(data,1)
    % condition for select steady state
    % skip the first 100 rows every 300 and copy only the latest 200
    if (mod(row,300)>=to_skip && mod(row,300)<300) 
        data_steady=[data_steady;data(row,:)];
    end
end


end
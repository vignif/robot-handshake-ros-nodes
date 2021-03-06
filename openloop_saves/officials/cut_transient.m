%% data_steady = cut_transient(data, to_skip)
% data is a matrix where each row is a new time instance
% to_skip is a parameter that will consider as transient the first to_skip
% rows of each new signal
% data_steady is the processed matrix with each transient row deleted.

function data_steady=cut_transient(data, to_skip)
data_steady=[];
signal_len = 300;

for row=1:size(data,1)
    % condition for select steady state
    % skip the first 100 rows every 300 and copy only the latest 200
    if (mod(row,signal_len)>=to_skip && mod(row,signal_len)<signal_len) 
        data_steady=[data_steady;data(row,:)];
    end
end
end
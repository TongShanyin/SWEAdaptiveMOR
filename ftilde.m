function [qkp1] = ftilde(Uqtilde,time,time_end,Uk,Pk)
    global limiter Np K B
    
    q = Uqtilde; %U
    
    % following should be replaced by only evaluating the function at Pk
    h = reshape(q(1:Np*K), [Np, K]);
    v = reshape(q(Np*K+1:end), [Np, K]);
    [h, v] = StateFixTS1D(h, v, time, time_end, B, limiter);
    q = [reshape(h, [Np*K, 1]);reshape(v,[Np*K, 1])]; 
    qkp1 = Uk(Pk,:)\q(Pk,:); % 
end


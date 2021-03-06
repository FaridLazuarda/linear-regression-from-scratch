module LinearRegression

    using LinearAlgebra, Compat, Statistics, DataFrames

    mutable struct Regression
        testData
        data
        xVar
        yVar
        model
    end

    # setter variabel x
    function setxVar(reg::Regression, xVar)
        reg.xVar = xVar
        return nothing
    end

    # setter variabel y
    function setyVar(reg::Regression, yVar)
        reg.yVar = yVar
        return nothing
    end

    # Menjumlahkan nilai berdasarkan variabel x
    function sumByxVar(reg::Regression, xVar)
        return sum(reg.data[:,xVar])
    end

    # Fungsi untuk memudahkan dot product
    function dotProduct(reg::Regression, data1, data2)
        tmpdata1 = reg.data[:,data1]
        tmpdata2 = reg.data[:,data2]
        return dot(tmpdata1, tmpdata2)
    end

    # Hanya untuk testing berapa hasil dari y prediksi
    function y_means(reg::Regression, arr, n_row)
        sum = 0
        for i=1:n_row
            sum = sum + arr[i,1]
        end
        return sum/n_row  
    end

    # fungsi untuk melakukan train
    function train(reg::Regression)
        n = size(reg.xVar, 1)
        tmpyVar = zeros(n+1)
        tmpyVar[1] = sumByxVar(reg, reg.yVar)
        
        for i = 1 : n
            tmpyVar[i+1] = dotProduct(reg, reg.xVar[i], reg.yVar)
        end

        tmp = zeros(n+1, n+1)
        n_data = size(reg.data,1)
        for i = 1 : n+1
            for j = 1 : n+1
                if i == 1
                    if j == 1
                        tmp[i,j] = n_data 
                    else 
                        tmp[i,j] = sumByxVar(reg, reg.xVar[j-1])
                    end
                else
                    if j == 1
                        tmp[i,j] = sumByxVar(reg, reg.xVar[i-1]) 
                    else 
                        tmp[i,j] = dotProduct(reg, reg.xVar[i-1], reg.xVar[j-1])
                    end
                end
            end
        end

        reg.model = inv(tmp)*tmpyVar
    end

    # fungsi untuk mencetak persamaan
    function equation(train_array)
        eq = "ŷ = " * string(train_array[1]) * " "
        add = ""
        for i=2:length(train_array)
            if train_array[i] >= 0
                add = add * "+ " * string(train_array[i]) * "x" * string(i-1) * " "
            else
                add = add * string(train_array[i]) * "x" * string(i-1) * " "
            end
        end
        eq = eq * add
        println("Regression Equation:")
        println(eq)
    
        return nothing
    end
    
    # fungsi untuk menghitung MAE
    function meanAbsoluteError(reg::Regression,res,test)
        n = nrow(test)
        means = 0
        actY = test[:,reg.yVar]
        for i = 1 : n
            means += abs(res[i] - actY[i])
        end
        
        mar = means / n
        println("Mean absolute error : $(mar)")
    end

    # fungsi untuk melakukan prediksi, menghasilkan array y
    function prediction(reg::Regression, testing)
        n = nrow(testing)
        result = zeros(n)
    
        for i = 1 : size(reg.model, 1)
            for j = 1 : n 
                if i == 1
                    result[j] = reg.model[i] 
                else 
                    result[j] += reg.model[i] * testing[j:j,reg.xVar[i-1]][1]
                end
            end
        end
        
        return result
    end
    
    # fungsi untuk menghasilkan RMS
    function rootMeanSquare(reg::Regression,res,test)
        n = nrow(test)
        Rmse = 0
        actY = test[:,reg.yVar]
        for i = 1 : n
            errorRmse = (res[i] - actY[i])^2
            Rmse += errorRmse
        end
    
        rmse = (Rmse / n)^0.5
        println("Root mean square error : $(rmse)")
    end
end
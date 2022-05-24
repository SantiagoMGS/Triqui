class Triqui
    @wins = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @board = [[1,2,3], [4,5,6], [7,8,9]]
    attr_accessor :player, :marker

    def self.print_board
        puts "\n-----------\nTABLERO"
        @board.each do |row|
            puts "#{row[0]} | #{row[1]} | #{row[2]}"
            puts "--+---+--" unless row==@board[2]
        end
        puts "-----------"
    end

    def initialize(player="")
        puts "Dame en nombre del malparido que va jugar"
        @player = gets.chomp
    end

    def self.start_game
        print_board()
        @flag = false
        while @flag == false do
            player_marker = get_player_marker()
            place_player_marker(player_marker)
            player_has_won?() ? break : ''
            computer_marker = get_computer_marker()
            place_computer_marker(computer_marker)
            computer_has_won?() ? break : ''
            print_board()
            puts "\nPapi, el PC jugo en #{computer_marker}"
        end
    end

    def self.get_player_marker
        @marker = 0
        print "Decime donde vas a jugar mk: "
        loop do
            @marker = gets.chomp.to_i
            if @board.flatten.include?(@marker)
                return @marker
                break
            else
                print "Pero escoge una posicion valida maricon hijueputa: "
            end
        end
    end

    def self.place_player_marker(player_marker)
        @board.each do |row|
            row.each_with_index do |position, index|
                if position == player_marker
                    row[index] = 'X'
                end
            end
        end

        @wins.each do |row|
            row.each_with_index do |position, index|
                if position == player_marker
                    row[index] = 'X'
                end
            end
        end

        return @wins
        return @board
    end

    def self.get_computer_marker
        @marker = 0
        loop do
            @marker = rand(1..9)
            if @board.flatten.include?(@marker)
                return @marker
                break
            end
        end
    end

    def self.place_computer_marker(computer_marker)
        @board.each do |row|
            row.each_with_index do |position, index|
                if position == computer_marker
                    row[index] = 'O'
                end
            end
        end

        @wins.each do |row|
            row.each_with_index do |position, index|
                if position == computer_marker
                    row[index] = 'O'
                end
            end
        end

        return @wins
        return @board
    end

    def self.player_has_won?
        if @wins.any? {|line| line==['X','X','X']} == true
            print_board()
            puts "Ganaste maricon"
            @flag = true
        end
    end

    def self.computer_has_won?
        if @wins.any? {|line| line==['O','O','O']} == true
            print_board()
            puts "Perdiste imbecil"
            @flag = true
        end
    end

end



Triqui.start_game

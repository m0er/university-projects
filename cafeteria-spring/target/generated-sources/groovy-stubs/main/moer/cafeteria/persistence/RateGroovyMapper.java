package moer.cafeteria.persistence;

import org.apache.ibatis.annotations.*;
import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;
import groovy.lang.*;
import groovy.util.*;

public interface RateGroovyMapper
 {
@org.apache.ibatis.annotations.Insert(value="INSERT INTO rate(client_id, menu_id, comment, rate_value, building) VALUES(#{userId}, #{menuId}, #{comment}, #{rateValue}, #{building})")  void insertRate(moer.cafeteria.rate.Rate rate);
@org.apache.ibatis.annotations.Select(value="\n		SELECT comment, rate_value as rateValue, building, client_id as userId\n		FROM rate\n		WHERE rate.menu_id = #{menuId};\n	")  java.util.List<moer.cafeteria.rate.Rate> getRateList(int menuId);
@org.apache.ibatis.annotations.Delete(value="DELETE FROM rate")  void deleteAllRate();
}

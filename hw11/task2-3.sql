/**
 *	3. Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.*
 */

shop.catalogs.insertMany( [
      { _id: 1, name: "Процессоры"},
      { _id: 2, name: "Материнские платы"},
      { _id: 3 ,name: "Видеокарты"}
   ] );

shop.products.insert({
    name: "Intel Core i3-8100",
    description: "Процессор для настольных персональных компьютеров, основанных на платформе Intel.",
    price: 7890.00,
    catalog: 1
})
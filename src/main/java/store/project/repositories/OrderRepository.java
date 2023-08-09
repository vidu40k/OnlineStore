package store.project.repositories;


import org.aspectj.weaver.ast.Or;
import org.springframework.data.jpa.repository.JpaRepository;
import store.project.models.Orders;

public interface OrderRepository  extends JpaRepository<Orders,Long> {

}

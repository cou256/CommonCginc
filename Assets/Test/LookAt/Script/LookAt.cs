using UnityEngine;

public class LookAt : MonoBehaviour
{
    [SerializeField] Transform target;
    void Update()
    {
        transform.LookAt(target);
    }
}
